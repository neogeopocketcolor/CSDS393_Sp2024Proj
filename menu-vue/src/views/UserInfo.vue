<template>
  <div class="form-wrapper">
      <el-form ref="form" :model="user" label-width="130px" v-loading="loading" 
                           element-loading-text="loading..." >
          <el-form-item label="account" >
              <el-input v-model="user.account" disabled></el-input>
          </el-form-item>
          <el-form-item label="password" prop="password">
              <el-input v-model="user.password" placeholder="enter your password"></el-input>
          </el-form-item>
          <el-form-item label="nickName" prop="nickName" >
              <el-input v-model="user.nickName" placeholder="enter your nickName"></el-input>
          </el-form-item>
          <el-form-item label="phone" prop="phone">
              <el-input v-model="user.phone" placeholder="enter your phone"></el-input>
          </el-form-item>
          <el-form-item label="hobby" prop="hobby">
              <el-input v-model="user.hobby" placeholder="enter your hobby"></el-input>
          </el-form-item>
          <el-form-item>
              <el-button type="primary" @click="onSubmit">save</el-button>
          </el-form-item>
      </el-form>
  </div>
</template>

<script>
import user from '@/store/modules/user';
import request from '@/utils/request'
import { spliceUrl, getFormData } from "@/utils/urlUtil";
export default {
  name: 'UserInfo',
  data() {
      return {
          loading: false,
          user: {
            account:'',
            password:'',
            nickName:'',
            phone:'',
            hobby:''
          },
          rules: {
             password: [
                  { required: true, message: 'password is empty!' }
              ],
              nickName: [
                  { required: true, message: 'nickName is empty!' },
            
              ],
              phone: [
                  { required: true, message: 'phone is empty!' }
              ],
              hobby: [
                  { required: true, message: 'hobby is empty!' }
              ]
          }

      };
  },
  mounted() {
      this.getUserInfo()
  },
  methods: {
      onSubmit: function () {
          this.$refs.form.validate((valid) => {
              if (valid) {
                  this.saveUser()
              } else {
                  console.log('error submit!!');
                  return false;
              }
          });
      },
      saveUser: function () {
          this.loading = true;
          let params = Object.assign({}, this.user);
          request({
              url: '/user/updateUser',
              method: 'post',
              data: getFormData(params)
          }).then(res => {
              this.modal("update success!")
          }).finally(() => {
              this.loading = false;
          })
      },
      getUserInfo: function () {
          this.loading = true;
         let account1 = JSON.parse(sessionStorage.getItem("vue_admin_template_user"))
          let params = {
              account: account1,
          }
          request({
              url: spliceUrl('/user/getUserByAccount', params),
              method: 'post'
          }).then(res => {
            let account = res.data.account||''
            let password = res.data.password||''
            let nickName = res.data.nickName||''
            let phone = res.data.phone||''
            let hobby = res.data.hobby||''

              this.user = {account,password,nickName,phone,hobby};
          }).finally(() => {
              this.loading = false;
          })
      },

  },
};
</script>

<style lang="scss" scoped>
.form-wrapper {
  padding-top: 50px;
  padding-left: 25px;
  padding-right: 100px;
}
</style>