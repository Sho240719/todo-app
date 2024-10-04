import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const listenInactiveHeartEvent = (boardId, taskId, commentId) => {
  $(".inactive-heart").on("click", () => {
    axios
      .post(`/boards/${boardId}/tasks/${taskId}/comments/${commentId}/like`)
      .then((response) => {
        if (response.data.status === "ok") {
          $(".active-heart").removeClass("hidden");
          $(".inactive-heart").addClass("hidden");
        }
      })
      .catch((e) => {
        window.alert("Error");
        console.log(e);
      });
  });
};

const listenActiveHeartEvent = (boardId, taskId, commentId) => {
  $(".active-heart").on("click", () => {
    axios
      .delete(`/boards/${boardId}/tasks/${taskId}/comments/${commentId}/like`)
      .then((response) => {
        if (response.data.status === "ok") {
          $(".inactive-heart").removeClass("hidden");
          $(".active-heart").addClass("hidden");
        }
      })
      .catch((e) => {
        window.alert("Error");
        console.log(e);
      });
  });
};

export {
  listenInactiveHeartEvent,
  listenActiveHeartEvent
}
