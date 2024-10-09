import $ from 'jquery'
import axios from 'modules/axios'

import {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
} from 'modules/handle_heart'

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}

const apendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class="task-comment"><p >${escape(comment.content)}</p></div>`
  )
}


document.addEventListener('turbolinks:load', () => {
  const dataset = $('#comment-show').data()
  const boardId = dataset.boardId
  const taskId = dataset.taskId
  const commentId = dataset.commentId

  axios.get(`/api/boards/${boardId}/tasks/${taskId}/comments`)
    .then((response) => {
      const comments = response.data
      $('.comments-container').empty()
      comments.forEach((comment) => {
        apendNewComment(comment)
      })
    })

  handleCommentForm()

  $('.add-comment-btn').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/api/boards/${boardId}/tasks/${taskId}/comments`, {
        comment: { content: content }
      })
        .then((res) => {
          const comment = res.data
          apendNewComment(comment)
          $('#comment_content').val('')
        })
    }
  })

  axios.get(`/api/boards/${boardId}/tasks/${taskId}/comments/${commentId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })

  listenInactiveHeartEvent(boardId, taskId, commentId)
  listenActiveHeartEvent(boardId, taskId, commentId)
})
