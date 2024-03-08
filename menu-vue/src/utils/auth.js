
const UserKey = 'vue_admin_template_user'

export function getUser() {
  return sessionStorage.getItem(UserKey)?JSON.parse(sessionStorage.getItem(UserKey)):undefined
}

export function setUser(user) {
   sessionStorage.setItem(UserKey,JSON.stringify(user))
}

export function removeUser() {
   sessionStorage.removeItem(UserKey)
}
