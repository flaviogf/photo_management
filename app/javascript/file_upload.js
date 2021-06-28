import {
  Core,
  FileInput,
  ProgressBar,
  ThumbnailGenerator,
  XHRUpload,
} from 'uppy'

export function configureFileUploadFor(formGroup) {
  const dataField = document.querySelector('.form__field--data')

  const fileField = document.querySelector('.form__field--file')

  const progressBar = document.querySelector('.form__progress-bar')

  const uppy = Core({
    autoProceed: true,
    restrictions: {
      maxNumberOfFiles: 1,
    },
  })
  .use(FileInput, {
    target: formGroup,
    pretty: false,
    replaceTargetContent: true,
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
  })

  uppy.on('upload-success', (file, response) => {
    const uploadedFileData = response.body['data']

    dataField.value = JSON.stringify(uploadedFileData)
  })
}
