<template>
    <div>
        <el-dialog width="1200px" :visible.sync="isShow" center 
           :close-on-press-escape="false"  @closed="pageClose">
            <div  class="video-player-wrapper">
               <vueMiniPlayer v-if="isShow" ref="vueMiniPlayer" :video="video" :mutex="true" @fullscreen="handleFullscreen" />
            </div>
        </el-dialog> 
    </div>
</template>

<script>
export default {
    name: 'VideoPlayer',
    props:{
        videoItem:{
         type:Object,
         default:()=>({})
        }
    },
    watch:{
      videoItem:{
        handler(val) {
          this.video = Object.assign(this.video,val)

        },
        deep: true,
        immediate: true,
      }
    },
    data() {
        return {
            isShow:false,
            video: {
              muted: false,
              loop: false,
              preload: 'auto',
              poster: '',
              volume: 1,
              autoplay: false
            }
        };
    },
    methods: {
       showDialog:function(){
          this.isShow = true
       },
       handleFullscreen:function(){

       },
       pageClose:function(){

       }
    },
};
</script>

<style lang="scss" scoped>

// @{deep} .el-dialog__body {
//     word-break: normal;
// }
::v-deep .qun-base-controls ._progress {
  white-space: nowrap ;
}

</style>