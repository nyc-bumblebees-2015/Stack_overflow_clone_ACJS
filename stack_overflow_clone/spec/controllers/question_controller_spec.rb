require 'spec_helper'

describe QuestionsController do
  let (:sample_question) { FactoryGirl.create(:question) }
  before(:each) do
    stub_authorize_user!
  end

  it "#index" do
    get :index
    expect(assigns(:questions)).to eq Question.all
  end

  it "#new" do
    get :new
    expect(assigns(:question)).to be_a_new(Question)
  end

  context "#create" do
    it "creates a question with valid params" do
      question :create, {question: {title: "yo", body: "hello", user_id: 1}}
      expect(response).to redirect_to :root
    end

  end

  context "#destroy" do
    it "deletes the question" do
      old_count = Question.count
      delete :destroy, id: sample_question.id
      expect(response).to redirect_to :root
      expect(Question.count).to eq(old_count -1)
      expect(Question.where(id: sample_question.id).count).to eq(0)
    end
  end
end
