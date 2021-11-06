let counter = 0;

export default () => {
  return {
    count: counter++,
    message: 'hello world',
  }
};
