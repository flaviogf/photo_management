import {
  Core,
  FileInput,
  ProgressBar,
  XHRUpload,
} from 'uppy'

export function configureFileUploadFor(formGroup) {
  const dataField = formGroup.querySelector('.form__field--data')

  const fileField = formGroup.querySelector('.form__field--file')

  const progressBar = formGroup.querySelector('.form__progress-bar')

  const fileList = formGroup.querySelector('.form__file-list')

  formGroup.removeChild(fileField)

  const uppy = Core({
    autoProceed: true,
  })
  .use(FileInput, {
    target: formGroup,
  })
  .use(ProgressBar, {
    target: progressBar,
    hideAfterFinish: false,
  })
  .use(XHRUpload, {
    endpoint: '/upload',
  })

  uppy.on('upload-success', (file, response) => {
    const uploadedFileData = response.body['data']

    dataField.value = JSON.stringify(uploadedFileData)

    const a = document.createElement('a')
    a.href = response.uploadURL
    a.target = '_blank'

    const text = document.createTextNode(file.name)

    a.appendChild(text)

    const li = document.createElement('li')

    li.appendChild(a)
  
    fileList.querySelector('ol').appendChild(li)
  })
}
