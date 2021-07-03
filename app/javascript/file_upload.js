import {
  Core,
  FileInput,
  ProgressBar,
  ThumbnailGenerator,
  XHRUpload,
} from 'uppy'

export function configureFileUploadFor(formGroup) {
  const dataField = document.querySelector('.form__field--data')

  const progressBar = document.querySelector('.form__progress-bar')

  const uppy = Core({
    autoProceed: true,
    restrictions: {
      maxNumberOfFiles: 1,
    },
  })
  .use(FileInput, {
    target: formGroup,
    replaceTargetContent: true,
    locale: {
      strings: {
        chooseFiles: 'Choose a file from your computer',
      },
    },
  })
  .use(ProgressBar, {
    target: progressBar,
    hideAfterFinish: false,
  })
  .use(ThumbnailGenerator, {
    thumbnailHeight: 600,
  })
  .use(XHRUpload, {
    endpoint: '/upload',
  })

  uppy.on('thumbnail:generated', (file, preview) => {
    const imagePreview = document.querySelector('.form__image-preview')

    imagePreview.src = preview

    const imagePreviewWrapper = document.querySelector('.form__image-preview-wrapper')

    if (imagePreviewWrapper.classList.contains('form__image-preview-wrapper--with-image')) return

    imagePreviewWrapper.classList.add('form__image-preview-wrapper--with-image')

    configureRemoveFile()
  })

  uppy.on('upload-success', (file, response) => {
    const uploadedFileData = response.body['data']

    dataField.value = JSON.stringify(uploadedFileData)

    formGroup.classList.add('hidden')
  })

  configureRemoveFile()

  function configureRemoveFile() {
    const removeFileButton = document.querySelector('.form__image-preview-wrapper--with-image')
  
    if (!removeFileButton) return
    
    removeFileButton.addEventListener('click', () => {
      uppy.getFiles().forEach(file => uppy.removeFile(file.id))

      formGroup.classList.remove('hidden')

      dataField.value = null
  
      let imagePreview = document.querySelector('.form__image-preview')
  
      imagePreview.remove()
  
      const imagePreviewWrapper = document.querySelector('.form__image-preview-wrapper')
  
      imagePreview = document.createElement('img')
  
      imagePreview.classList.add('form__image-preview')
  
      imagePreviewWrapper.appendChild(imagePreview)
  
      if (!imagePreviewWrapper.classList.contains('form__image-preview-wrapper--with-image')) return
  
      imagePreviewWrapper.classList.remove('form__image-preview-wrapper--with-image')
    })
  }
}
