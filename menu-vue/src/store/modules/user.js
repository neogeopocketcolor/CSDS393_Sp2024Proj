import { login, logout } from '@/api/user'
import { getUser, setUser, removeUser } from '@/utils/auth'
import router, { resetRouter,adminRoutes,constantRoutes } from '@/router'

const getDefaultState = () => {
 let user =  getUser();
  return {
    userId: user?.id,
    name: user?.account
  }

}

const state = getDefaultState()

const mutations = {
  RESET_STATE: (state) => {
    Object.assign(state, getDefaultState())
  },
  SET_USERID: (state, userId) => {
    state.userId = userId
  },
  SET_NAME: (state, name) => {
    state.name = name
  },
  SET_AVATAR: (state, avatar) => {
    state.avatar = avatar
  },
  SET_ROLE: (state, role) => {
    state.role = role
  }
}

const actions = {
  // user login
  login({ commit }, userInfo) {
    
    return new Promise((resolve, reject) => {
      login(userInfo).then(response => {
        debugger
        let userInfo1 = response.data;
 

        commit('SET_USERID', userInfo1.id)
        commit('SET_NAME', userInfo1.account)
        setUser(userInfo1)
        resolve()
      }).catch(error => {
        reject(error)
      })
    }) 
  },


  // // get user info
  // getInfo({ commit, state }) {
  //   return new Promise((resolve, reject) => {
  //     let data = {name:'222',avatar:''};
  //     const { name, avatar } = data

  //       commit('SET_NAME', name)
  //       commit('SET_AVATAR', avatar)
  //       resolve(data)
  //     // getInfo(state.token).then(response => {
  //     //   const { data } = response

  //     //   if (!data) {
  //     //     return reject('Verification failed, please Login again.')
  //     //   }

  //     //   const { name, avatar } = data

  //     //   commit('SET_NAME', name)
  //     //   commit('SET_AVATAR', avatar)
  //     //   resolve(data)
  //     // }).catch(error => {
  //     //   reject(error)
  //     // })
  //   })
  // },

  // user logout
  logout({ commit, state }) {
    return new Promise((resolve, reject) => {
      removeUser() // must remove  token  first
      resetRouter()
      commit('RESET_STATE')
      resolve()
    })
  },

  // remove token
  resetToken({ commit }) {
    return new Promise(resolve => {
      removeUser() // must remove  token  first
      commit('RESET_STATE')
      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}

