<template>
  <div>
    <div class="card">
      <div class="card__header-container">
        <h1 class="pull-left card__header">Recipients</h1>
        <a :href="new_recipient_path" class="btn btn-primary pull-right card__header-action">Add recipient</a>
        <div class="clearfix"></div>
      </div>

      <table id="recipients-table" class="table">
        <thead>
          <tr>
            <th></th>
            <th>First name</th>
            <th>Last name</th>
            <th>Email</th>
            <th class="table-column table-column--small">Status</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="recipient in recipients">
            <td><input type="checkbox" v-model="recipient.selected" v-if="recipient.status == 'unsent'"></td>
            <td>{{recipient.first_name}}</td>
            <td>{{recipient.last_name}}</td>
            <td>{{recipient.email}}</td>
            <td>{{recipient.status}}</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="footer-action" v-if="selectedRecipients.length > 0">
      <div class="container">
        <span class="footer-action__description pull-left">{{selectedRecipientText}}</span>
        <input type="submit" class="btn btn-primary footer-action__button pull-right" @click="sendForm">Send surveys</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      recipients: window.recipients,
      new_recipient_path: window.routes.new_recipient_path,
      survey_batches_path: window.routes.survey_batches_path
    }
  },
  computed: {
    selectedRecipients: function() {
      return this.recipients.filter(recipient => recipient.selected);
    },
    selectedRecipientText: function() {
      const sr = this.selectedRecipients;
      const count = sr.length;
      const base = `Send surveys to ${sr[0].first_name} ${sr[0].last_name}`;

      if(count > 1) {
        return `${base} and ${sr.length - 1} more`
      } else {
        return base;
      }
    }
  },
  methods: {
    sendForm: function() {
      const form = document.getElementById("send-survey-form")
      const ids = document.getElementById("send_survey_ids");
      ids.value = this.selectedRecipients.map(rec => rec.id)
      form.submit();
    }
  }
}
</script>

<style>
  body {
    margin-bottom: 60px;
  }

  .footer-action {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background-color: #21C798;
    padding: 30px;
    color: #fff;
  }

  .footer-action__button {
    padding: 6px 12px;
    background-color: #1A3B52;
    color: #fff;

    &:hover,
    &:active,
    &:focus {
      background-color: darken(#1A3B52, 10%);
    }
  }
</style>
