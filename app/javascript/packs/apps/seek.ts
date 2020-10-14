const seekSupport = () => {
  const video = document.getElementById('video') as HTMLVideoElement
  if (!video) {
    return
  }
  const seek = document.getElementById('bridge_content_inspection_seek') as HTMLInputElement
  if (!seek) {
    return
  }
  if (seek.value) {
    video.currentTime = Number(seek.value)
  }
  video.addEventListener('timeupdate', () => {
    seek.value = String(video.currentTime)
  })
}

seekSupport()