class Blog < ApplicationRecord

    enum status: { draft: 0, published: 1} 
    
    # title is the title of the blog, we can enter whatever blog,
    # when hit save, it gonna generate a slug for us by taking the title
    # and converting that.
    extend FriendlyId
    friendly_id :title, use: [:slugged]
end
