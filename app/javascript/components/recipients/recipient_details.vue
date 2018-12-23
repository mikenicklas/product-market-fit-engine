<template>
  <div class="sidebar-container">
    <div class="sidebar-container__overlay" @click="$emit('resetActiveRecipient')"></div>
    <div class="sidebar-container__sidebar">
      <h1>Recipients: {{recipient.first_name}} {{recipient.last_name}}</h1>
      <p>{{recipient.email}}</p>

      <div v-if="recipient.status == 'completed'">
        <h3>Ideal Customer</h3>
        {{recipient.survey_responses[0].ideal_customer}}

        <h3>Main Benefits</h3>
        {{recipient.survey_responses[0].main_benefits}}

        <h3>Recommended Improvements</h3>
        {{recipient.survey_responses[0].recommended_improvements}}
      </div>

      <div v-if="recipient.enrichment && recipient.enrichment.data">
        <h4>Enriched Data</h4>
        <ul>
          <li v-if="enrichment.demographics.gender">Gender: {{ enrichment.demographics.gender }}</li>
          <li v-if="enrichment.demographics.age_range">Age: {{ enrichment.demographics.age_range }}</li>
          <li v-if="enrichment.demographics.location_general">Location: {{ enrichment.demographics.location_general }}</li>
          <li v-for="profile in enrichment.social_profiles">{{profile.type_name}} Profile<span v-if="profile.followers"> ({{ profile.followers }})</span> - {{profile.url}}</li>
        </ul>
        <div v-if="enrichment.photos">
          <img v-for="image in enrichment.photos" :src="image.url" class="img-responsive" style="height: 75px; width: 75px;" />
        </div>
        <code>
          {{ recipient.enrichment.data }}
        </code>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["recipient"],
  computed: {
    enrichment: function() {
      if(this.recipient.enrichment && this.recipient.enrichment.data) {
        return JSON.parse(this.recipient.enrichment.data)
      } else {
        return null
      }
    }
  }
}
</script>

<style scoped>
  .sidebar-container {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 99999;
    overflow-y: scroll;
  }

  .sidebar-container__overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,.4);
  }

  .sidebar-container__sidebar {
    position: fixed;
    top: 0;
    right: 0;
    width: 90%;
    max-width: 800px;
    height: 100%;
    background-color: #FFF;
    padding: 48px;
    overflow-y: scroll;
  }
</style>
