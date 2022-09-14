require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }

    # GET /

    context 'GET /' do
      it "returns 200 OK" do
        response = get('/')

        expect(response.status).to eq (200)
        expect(response.body).to eq ('Hello!')
      end
    end

    context 'GET /' do
      it "returns 200 OK" do
        response = get('/', name: 'Leo', cohort_name: 'April')

        expect(response.status).to eq (200)
        expect(response.body).to eq ('Hello!')
      end
    end

    context "GET /" do
      it 'returns 200 OK' do
        # Assuming the post with id 1 exists.
        response = get('/name')
  
        expect(response.status).to eq(200)
      end
  
      it 'returns 200 OK and name param' do
        # Assuming the param with name exists.
        response = get('/name?name=Julia')
  
        expect(response.status).to eq(200)
        expect(response.body).to eq('Julia')
      end
  
      it 'returns 404 Not Found' do
        response = get('/posts?id=276278')
  
        expect(response.status).to eq(404)
        # expect(response.body).to eq(expected_response)
      end

      it 'returns both name params' do
        response = get('/names?name1=Julia&name2=Mary')

        expect(response.status).to eq(200)
        expect(response.body).to eq('Julia, Mary')
      end

      it 'returns both name params in alphabetical order' do
        response = get('/names?name1=Zulia&name2=Mary')
        alpha = (response.body.split(' ').sort).join(', ')
        alpha.slice!(-1)
        expect(response.status).to eq(200)
        expect(alpha).to eq('Mary, Zulia')
      end

      it 'returns a list of names in alphabetical order' do
        response = post('sort-names?name1=Joe&name2=Alice')
        #alpha = (response.body.split(' ').sort).join(', ')
        # expect(response.status).to eq(200)
        expect(response.body).to eq('Alice,Joe')
      end

      it 'returns a list of 4 names in alphabetical order' do
        response = post('sort-names?name1=Joe&name2=Alice&name3=Zoe&name4=Julia&name5=Kieran')
        #alpha = (response.body.split(' ').sort).join(', ')
        # expect(response.status).to eq(200)
        expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
      end
    end
end