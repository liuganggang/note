var ant = prompt('what is your name?', '');
try{
  if(!ant || isNaN(ant) || ant == 'liugang' ){
    throw new Error('not right');
  }
  alert('name is ' + ant);
}catch(e){
  alert(e.message);
}