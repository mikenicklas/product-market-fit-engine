<template>
  <div class="text-left">
    <div class="card__header-container">
      <h3 class="u-fw--semi card__header">
        <span class="u-c--light-gray">Segments</span>: <span class="u-c--dark-gray">{{currentSegment.label}}</span>
      </h3>
      <p>{{description}}</p>
    </div>

    <div class="row u-mt--4 text-center">
      <div class="col-sm-6">
        <h5>Ideal customer</h5>
        <vue-word-cloud
          :words="formattedWordCloud.idealCustomer"
          :color="([, weight]) => weight > 10 ? '#ffcd56' : weight > 5 ? '#36a2eb' : '#ff6384'"
          font-family="Roboto"
          :animation-duration="0"
          style="width: 200px; height: 200px; margin: auto"
        />
      </div>

      <div class="col-sm-6">
        <h5>Main benefits</h5>
        <vue-word-cloud
          :words="formattedWordCloud.mainBenefits"
          :color="([, weight]) => weight > 10 ? '#ffcd56' : weight > 5 ? '#36a2eb' : '#ff6384'"
          font-family="Roboto"
          :animation-duration="0"
          style="width: 200px; height: 200px; margin: auto"
        />
      </div>
    </div>

    <div class="row text-center u-mt--4">
      <div class="col-sm-6 col-sm-offset-3">
        <h5>Recommended improvements</h5>
        <vue-word-cloud
          :words="formattedWordCloud.recommendedImprovements"
          :color="([, weight]) => weight > 10 ? 'DeepPink' : weight > 5 ? 'RoyalBlue' : 'Indigo'"
          font-family="Roboto"
          :animation-duration="0"
          style="width: 200px; height: 200px; margin: auto"
        />
      </div>
    </div>
  </div>
</template>

<script>
import VueWordCloud from 'vuewordcloud';

export default {
  components: {
    [VueWordCloud.name]: VueWordCloud,
  },
  props: ["current-segment"],
  data() {
    return {
      wordCloud: window.wordCloud
    }
  },
  computed: {
    formattedWordCloud() {
      const formatted = {
        idealCustomer: [],
        recommendedImprovements: [],
        mainBenefits: []
      };

      const segmentWords = this.wordCloud[this.currentSegment.type];

      for (let word in segmentWords.ideal_customer) {
        formatted.idealCustomer.push([word, segmentWords.ideal_customer[word]])
      }
      for (let word in segmentWords.main_benefits) {
        formatted.mainBenefits.push([word, segmentWords.main_benefits[word]])
      }
      for (let word in segmentWords.recommended_improvements) {
        formatted.recommendedImprovements.push([word, segmentWords.recommended_improvements[word]])
      }

      return formatted;
    },
    description() {
      if(this.currentSegment.type == "very_disappointed") {
        return "These customers are your die-hard fans. You should spend half of your time doubling down on the main benefits they appreciate."
      } else if (this.currentSegment.type == "semi_disappointed") {
        return "These customers are close to becoming die-hard fans. You should spend the other half of your time building the features they want to convert them to die-hard fans."
      } else {
        return "These are your least important customers. Althought they're important, they aren't in a position where you can easily convert them."
      }
    }
  }
}
</script>
