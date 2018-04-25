class Moderators::ApplicationController  < ApplicationController
before_action :authenticate_moderator!
end
