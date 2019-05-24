class SnippetsController < ApplicationController
    skip_before_action :authorized
end
