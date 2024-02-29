describe FactoryClone do
  let(:sample_factory) { described_class.factory(:info) { gender { :male } } }
  let(:sample_class) { Object.const_set('Info', Class.new { attr_accessor :gender }) }

  describe '#factory' do
    context 'when factory is not defined' do
      it 'registers new factory' do
        expect(sample_factory.name).to eql(:info)
      end
    end

    context 'when factory is already defined' do
      it 'raises factory already defined exception' do
        expect { sample_factory }.to raise_error(FactoryClone::Errors::AlreadyDefinedFactory)
      end
    end
  end

  describe '#create' do 
    context 'when factory is not defined' do
      it 'raises factory undefined exception' do
        expect { described_class.create(:infos, name: 'Adam') }
          .to raise_error(FactoryClone::Errors::UndefinedFactory)
      end
    end

    context 'when factory is defined' do
      context 'when class is defined' do
        context 'when attributes are valid' do
          before { sample_class }

          it 'creates an instance of class' do
            instance = described_class.create(:info, gender: :male)
            expect(instance).to be_an_instance_of(Info)
            expect(instance.gender).to eql('male')
          end
        end

        context 'when attributes are invalid' do
          it 'raises invalid attributes exception' do
            expect { described_class.create(:info, gender: :male, name: :adam) }
              .to raise_error(FactoryClone::Errors::InvalidAttribute)
          end
        end
      end

      context 'when class is not defined' do
        before do
          described_class.factory(:infos) { gender { :male } }
        end

        it 'raises no class found exception' do
          expect {described_class.create(:infos) }.to raise_error(FactoryClone::Errors::InvalidClass)
        end
      end
    end 
  end
end