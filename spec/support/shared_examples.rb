RSpec.shared_examples 'an oauth2 strategy' do
  describe '#authorize_params' do
    context 'when passed an authorize_params option' do
      let(:options) { {authorize_params: {foo: 'bar', baz: 'zip'}} }

      it 'includes them' do
        expect(strategy.authorize_params['foo']).to eq('bar')
        expect(strategy.authorize_params['baz']).to eq('zip')
      end
    end

    context 'when passed an authorize_options option' do
      let(:options) do
        {authorize_options: [:scope, :foo], scope: 'bar', foo: 'baz'}
      end

      it 'includes the specified options' do
        expect(strategy.authorize_params['scope']).to eq('bar')
        expect(strategy.authorize_params['foo']).to eq('baz')
      end
    end
  end

  describe '#token_params' do
    context 'when passed a token_params option' do
      let(:options) { {token_params: {foo: 'bar', baz: 'zip'}} }

      it 'includes them' do
        expect(strategy.token_params['foo']).to eq('bar')
        expect(strategy.token_params['baz']).to eq('zip')
      end
    end
  end

  context 'when passed a token_options option' do
    let(:options) do
      {token_options: [:scope, :foo], scope: 'bar', foo: 'baz'}
    end

    it 'includes the specified options' do
      expect(strategy.token_params['scope']).to eq('bar')
      expect(strategy.token_params['foo']).to eq('baz')
    end
  end
end

RSpec.shared_examples 'an oauth2 strategy client' do
  context 'when passed client_options' do
    let(:options) do
      {client_options: {'authorize_url' => 'https://example.com'}}
    end

    it 'is initialized with symbolized client_options' do
      expect(client.options[:authorize_url]).to eq('https://example.com')
    end
  end
end
