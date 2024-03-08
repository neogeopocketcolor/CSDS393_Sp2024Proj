import request from '@/utils/request'
export const uploadFile = function(file){
    let formData = new FormData();
    formData.append('file',file)
    return  request({
        url: '/upload',
        method: 'post',
        data: formData
      });
}