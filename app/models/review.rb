class Review < ActiveRecord::Base
  belongs_to :reviewable, :polymorphic => true, :counter_cache => true
  belongs_to :user
end
