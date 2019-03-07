class Blog < ApplicationRecord
    extend FriendlyId
    # title is the title of the blog, we can enter whatever blog,
    # when hit save, it gonna generate a slug for us by taking the title
    # and converting that.
    friendly_id :title, use: [:slugged]
end
