<script>
import { Pie } from 'vue-chartjs'

export default {
  extends: Pie,
  props: ["responses"],
  data() {
    const self = this;
    return {
      chartdata: {
        datasets: [{
          labels: ["Very disapointed", "Semi disappointed", "Not disapointed"],
          data: this.formattedResponseCounts(),
          backgroundColor: ["#ffcd56", "#36a2eb", "#ff6384"],
          label: "Product market fit"
        }],
        labels: ["Very disapointed", "Semi disappointed", "Not disapointed"]
      },
      labels:  ["Very disapointed", "Semi disappointed", "Not disapointed"],
      chartoptions: {
        responsive: false
      }
    }
  },
  methods: {
    formattedResponseCounts: function() {
      return ["very_disappointed", "semi_disappointed", "not_disappointed"].map((type) => {
        return this.formattedResponseCount(type)
      });
    },
    formattedResponseCount: function(type) {
      if(this.responses && this.responses[type]) {
        return this.responses[type].length
      } else {
        return 0;
      }
    }
  },
  mounted () {
    this.renderChart(this.chartdata, this.chartoptions)
  }
}
</script>
