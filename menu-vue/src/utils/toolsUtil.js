import { getThumbnails } from 'video-metadata-thumbnails';


//从文件获取本地访问链接
export const createObjectURL = function(file) {
  var localPath = "";
  if (window.createObjectURL != undefined) {
    // basic
    localPath = window.createObjectURL(file);
  } else if (window.URL != undefined) {
    // mozilla(firefox)
    localPath = window.URL.createObjectURL(file);
  } else if (window.webkitURL != undefined) {
    // webkit or chrome
    localPath = window.webkitURL.createObjectURL(file);
  }

  return localPath;
}

//从视频文件中获取第一帧缩略图
export const getVideoPic = async function(file){
    const thumbnails = await getThumbnails(file, {
        quality: 0.6
     });

    return createObjectURL(thumbnails[0].blob)
}

export const getVideoPicBlob = async function(file){
  const thumbnails = await getThumbnails(file, {
      quality: 0.6
   });
  return thumbnails[0]
}