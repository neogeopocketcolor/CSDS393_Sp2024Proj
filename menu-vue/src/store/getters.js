const getters = {
  sidebar: state => state.app.sidebar,
  device: state => state.app.device,
  userId: state => state.user.userId,
  avatar: state => state.user.avatar,
  role: state => state.user.role,
  name: state => state.user.name
}
export default getters
