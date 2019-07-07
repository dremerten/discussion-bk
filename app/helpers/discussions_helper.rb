module DiscussionsHelper

	# checks that the user is signed in and is the 'owner/author' of the discussion 
  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end
   # checks that th user is signed in and is the 'owner/author' of the reply
  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

end
