<template>
  <div class="sidebar-container">
    <div class="sidebar-container__overlay" @click="$emit('resetActiveRecipient')"></div>
    <div class="sidebar-container__sidebar">
      <h1>Recipients: {{recipient.first_name}} {{recipient.last_name}}</h1>
      <p>{{recipient.email}}</p>

      <h3>Ideal Customer</h3>
      {{recipient.survey_responses[0].ideal_customer}}

      <h3>Main Benefits</h3>
      {{recipient.survey_responses[0].main_benefits}}

      <h3>Recommended Improvements</h3>
      {{recipient.survey_responses[0].recommended_improvements}}
    </div>
  </div>
</template>

<script>
export default {
  props: ["recipient"]
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
  }
</style>
