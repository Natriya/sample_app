# En untilisant le symbole ':user', nous faisons que
# Factory Girl simule un modele User.
Factory.define :user do |user|
  user.nom "Michael Hartl"
  user.email "mhartl@example.com"
  user.password "foobar"
  user.password_confirmation "foobar" 
end