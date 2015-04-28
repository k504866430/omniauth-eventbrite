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

  describe '#info' do
    before { allow(strategy).to receive(:raw_info).and_return(response) }

    subject(:info) { strategy.info }

    context 'with complete information' do
      let(:response) do
        {'first_name' => 'Test',
         'last_name' => 'User',
         'user_id' => 123_456_789,
         'date_modified' => '2015-04-27 21:59:40',
         'date_created' => '2015-04-27 21:47:16',
         'email' => 'test@example.com'}
      end

      describe 'email' do
        subject { info['email'] }

        it { is_expected.to eq('test@example.com') }
      end

      describe 'first_name' do
        subject { info['first_name'] }

        it { is_expected.to eq('Test') }
      end

      describe 'full_name' do
        subject { info['name'] }

        it { is_expected.to eq('Test User') }
      end

      describe 'last_name' do
        subject { info['last_name'] }

        it { is_expected.to eq('User') }
      end
    end

    context 'with incomplete information' do
      let(:response) do
        {'date_created' => '2015-04-27 21:47:16',
         'user_id' => 123_456_789,
         'email' => 'test@example.com',
         'date_modified' => '2015-04-27 21:47:17'}
      end

      describe 'email' do
        subject { info['email'] }

        it { is_expected.to eq('test@example.com') }
      end

      describe 'first_name' do
        subject { info['first_name'] }

        it { is_expected.to be_nil }
      end

      describe 'full_name' do
        subject { info['name'] }

        it { is_expected.to be_nil }
      end

      describe 'last_name' do
        subject { info['last_name'] }

        it { is_expected.to be_nil }
      end
    end
  end
end
