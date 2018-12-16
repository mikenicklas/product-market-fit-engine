<template>
  <div>
    <h1>{{currentSegment}}</h1>
    <button class="btn btn-primary" v-on:click="$emit('update:current-segment', false)">View all segments</button>
  </div>
</template>

<script>
export default {
  props: ["current-segment"]
}
</script>
