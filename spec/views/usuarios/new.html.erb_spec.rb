require 'spec_helper'

describe "usuarios/new" do
  before(:each) do
    assign(:usuario, stub_model(Usuario,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new usuario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => usuarios_path, :method => "post" do
      assert_select "input#usuario_name", :name => "usuario[name]"
      assert_select "input#usuario_email", :name => "usuario[email]"
    end
  end
end
