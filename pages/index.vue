<template>
  <div>
    <button @click="updateAll">
      {{updateAllButtonMessage}}
    </button>
    <br>
    <button @click="upCount">
      {{countUpButtonMessage}}
    </button>
    <p>Count: {{state.count}}</p>

    <button @click="sendRequest">
      {{sendRequestButtonMessage}}
    </button>
    <p>Message: {{state.message}}</p>
  </div>
</template>

<script setup>
  import { reactive } from 'vue';

  const countUpButtonMessage = "count up";
  const sendRequestButtonMessage = "send request";
  const updateAllButtonMessage = "update all";
  const state = reactive({
    count: 0,
    message: '',
  });

  const sendRequest = async () => {
    const res = await $fetch('/api/message');
    state.message = res.message;
  }

  const updateAll = async() => {
    const res = await $fetch('/api/message');
    state.count = res.count;
    state.message = res.message;
  }

  const upCount = () => {
    state.count++;
  }
</script>
