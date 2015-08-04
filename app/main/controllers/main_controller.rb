if RUBY_ENGINE == 'opal'
  require 'opal-jquery'
end

module Main
  class MainController < Volt::ModelController

    before_action :require_login, only: :index

    def index
      # Add code for when the index view is loaded
      reset_message
    end

    def about
      # Add code for when the about view is loaded
    end


    private
    #not sure why private methods are accessible from view?

    def send_message
      store._messages << page._form
      reset_message
      scroll_bottom # this no work!
    end

    def reset_message
      page._form = Message.new
    end

    def scroll_bottom
      panel_body = Element.find(".panel-body")
      panel_body.animate({ scrollTop: panel_body.children.height }, speed: "normal")
    end


    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
