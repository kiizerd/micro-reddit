# Micro-Reddit

A simple app with no front-end.

Contains 3 models, a User, a Post, and a Comment.

User table has 4 columns, 
 | id:primary_key | username:string | email:string | password:string |
 | -------------- | --------------- | ------------ | --------------- |

Post table has 5 columns,
 | id:primary_key | title:string | link:string | body:text | user_id:foreign_key |
 | -------------- | ------------ | ----------- | --------- | ------------------- |

Comment table has 3 columns,
 | id:primary_key | body:text | user_id:foreign_key | post_id:foreign_key |
 | -------------- | --------- | ------------------- | ------------------- |

 The Post model has a custom validator, PostValidator, inheriting from ActiveModel::Validator, which checks if the post has either a body or a link.