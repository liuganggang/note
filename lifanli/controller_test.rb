
class Management::AgentsControllerTest < ActionController::TestCase
  setup do
    @manager = managers(:default)
    @agent = managers(:agent)
    sign_in(:manager, @manager)
  end

  test "index page" do
    Agent.any_instance.stubs(:destroy).returns(false)
    Sms.stubs(:send_code).returns(false)

    get :index
    patch :update, id: @agent.id, agent: {name: nil}
    assert assigns(:agents)
    assert_response :success
    assert_template :index
    assert_redirected_to action: :index
    assert_redirected_to management_agent_path(assigns(:agent))

    assert_raise(ActionController::UrlGenerationError) {
      get :index, store_id: @store.id
    }

    certificate = fixture_file_upload 'test.p12', Mime::P12

    xhr :patch, :update_state, id: @register.id, state: 'aaa'
    assert_select ".alert"

    set_flash[:success]
  end
end
