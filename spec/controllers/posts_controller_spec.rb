RSpec.describe PostsController, type: :controller do

  describe "GET #new" do
    before { get :new }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the :new template' do
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'when user add files' do
      let(:valid_params) {{ post: attributes_for(:post, :with_all_attachment) }}

      it "returns http success" do
        post :create, params: valid_params
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user not add files' do
      let(:invalid_params) {{ post: attributes_for(:post) }}

      it "returns http success" do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
