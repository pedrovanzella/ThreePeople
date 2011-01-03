require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Word.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Word.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to word_url(assigns(:word))
  end

  def test_show
    get :show, :id => Word.first
    assert_template 'show'
  end
end
