object false

child(:@quiz) { attributes :id }
child(:@questions) { attributes :id, :question }
child(:current_user) { attributes :id }
node(:already_submitted) { || @already_submitted }