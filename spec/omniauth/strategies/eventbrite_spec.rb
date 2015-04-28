RSpec.describe OmniAuth::Strategies::Eventbrite do
  def app
    lambda do |_|
      [200, {}, ['Hello, world.']]
    end
  end

  let(:fresh_strategy) { Class.new(OmniAuth::Strategies::Eventbrite) }
  let(:options) { {} }

  before { OmniAuth.config.test_mode = true }
  after { OmniAuth.config.test_mode = false }

  subject(:strategy) { fresh_strategy.new(app, options) }

  it_behaves_like 'an oauth2 strategy'

  describe '#client' do
    subject(:client) { strategy.client }

    it_behaves_like 'an oauth2 strategy client'

    describe '#options' do
      subject(:client_options) { client.options }

      describe '[:authorize_url]' do
        subject { client_options[:authorize_url] }

        it { is_expected.to eq('/oauth/authorize') }
      end

      describe '[:token_url]' do
        subject { client_options[:token_url] }

        it { is_expected.to eq('/oauth/token') }
      end
    end

    describe '#site' do
      subject { client.site }

      it { is_expected.to eq('https://www.eventbrite.com') }
    end
  end

  describe '#callback_path' do
    subject { strategy.callback_path }

    it { is_expected.to eq('/auth/eventbrite/callback') }
  end
end
