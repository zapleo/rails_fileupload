RSpec.describe PostsController, type: :controller do

  describe 'GET #new' do
    before { get :new }

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'renders the :new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'when user add all files' do
      let(:valid_params) {{ post: attributes_for(:post, :with_all_attachment) }}

      before { post :create, params: valid_params }

      it 'have success flash notice' do
        expect(flash[:success]).to eq(I18n.t('flash.success'))
      end

      it 'redirect to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end

  end
end
