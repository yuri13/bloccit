require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do
  let (:my_question) do
    Question.create(
      id: 1,
      title: RandomData, random_sentence,
      body: RandomData, random_paragraph,
      resolved: false
    )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

    it "assigns my_question to @question" do
      get "index"
      expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end
  end

    it "renders the #show view" do
      get :show, {id: my_question.id}
      expect(response).to render_template :show
    end
  end

    it "assigns my_question to @question" do
      get :show, {id: my_question.id}
      expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "DELETE destroy" do
    it "deletes the question" do
      delete :destroy, {id: my_question.id}
      count = Question.where({id: my_question.id}).size
      expect(count).to eq 0
    end
  end

    it "redirects to questions index" do
      delete :destroy, {id: my_question.id}
      expect(response).to redirect_to questions_path
    end
  end

end
