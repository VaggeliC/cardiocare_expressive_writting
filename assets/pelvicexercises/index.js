
var progressIntervalstart;
var progressIntervalempty;
var buttoninterval;

function startProgressBar(interval,widthval,secon) {
  //console.log(widthval);
  //console.log(secon);
  var language = {
    gr: {
        title: "ΤΙ ΦΑΣΗ"
    },

    en: {
        title: "Contract"
    }
  };

  const progress = document.getElementById("progress");
  const indicator = document.getElementById("indicator");
  counter=1;
  document.getElementById("title").innerText = "Contract";
  progress.style.width = "";
  //console.log("progress interval start");
 // console.log(progressIntervalstart);
  if(progressIntervalstart){
    clearInterval(progressIntervalstart);
  }
   progressIntervalstart = setInterval(() => {
    //console.log("inside if");
    const width = progress.style.width;
    
    if (!width) {
      progress.style.width = "1%";
      //indicator.innerText = "1";
      return;
    }
    //console.log(width);
    //console.log(widthval);
    if (width === widthval) {
      document.getElementById("controls").innerHTML = "Contract for " +secon + " seconds";
      setTimeout(function () {
        
        emptyProgressBar(interval,widthval);
       
      }, secon*1000);
      clearInterval(progressIntervalstart);
      return;
      
    }

    if(window.location.hash){
       if(window.location.hash == "#gr") {
       title.textContext = language.gr.title;
       }
    }

    const numericWidth = parseInt(width.split("%")[0], 0);
    progress.style.width = `${numericWidth + 1}%`;
   
    /*if(numericWidth==20 || numericWidth==40 || numericWidth==60 || numericWidth==80){
      
      counter++;
      indicator.innerText = counter;
    }*/
   // indicator.innerText = `${numericWidth}`;
  }, interval);//miliseconds 50*100%==5 seconds
}

 


function emptyProgressBar(interval,widthval) {
  const progress = document.getElementById("progress");
  const indicator = document.getElementById("indicator");
  counter = 5;
  progress.style.width = "";
  document.getElementById("title").innerText = "";
  document.getElementById("title").innerText = "Rest";
  document.getElementById("title").innerText = "Rest";
  document.getElementById("controls").innerHTML = "";
  if(progressIntervalempty){
    clearInterval(progressIntervalempty);
  }
   progressIntervalempty = setInterval(() => {
    const width = progress.style.width;
    if (!width) {
      progress.style.width = widthval; //"100%";
      //indicator.innerText = "5";
      return;
    }
    if (width === "0%") {
      indicator.innerText = "";
      clearInterval(progressIntervalempty);
      return;
    }

    const numericWidth = parseInt(width.split("%")[0], 0);
    progress.style.width = `${numericWidth - 1}%`;
   //indicator.innerText = `${numericWidth - 1}%`;

    /*if(numericWidth==20 || numericWidth==40 || numericWidth==60 || numericWidth==80){
      
      counter--;
      indicator.innerText = counter;
    }*/
  }, interval);
}


function repetitions(repetition,intervalsec,width,secon,strength,counterstrength) {
  repet = 0;
  //console.log("inside");
  if(repetition==counterstrength){
    repetitionstrength(repetition,repet,intervalsec,width,secon)
    return;
  }
  
  document.getElementById("controls").innerHTML = repetition-repet+" repetions to go"; 
  if (repet==0){
    startProgressBar(intervalsec,width,secon);
    repet++;
  }
 
  if(buttoninterval){
    clearInterval(buttoninterval);
  }
  buttoninterval = setInterval(function(){ 
    document.getElementById("controls").innerHTML = repetition-repet+" repetions to go";  
    if (repet==repetition) {
      document.getElementById("controls").innerHTML = "Completed"; 
      //location.reload();
      return;
    }
    //console.log("isnide");
    if (strength=="false"){
      $("#testcontractions").click();
    }
    else{
      if(repetition-repet>counterstrength){
       // console.log("inside test button");
        $("#testcontractions").click();
      }
      else{
       
        repetitionstrength(repetition,repet,intervalsec,width,secon)
        clearInterval(buttoninterval); 
        return;
          
      }
    }
    repet++;
    
   },(intervalsec*200)+3000);

     
}


function repetitionstrength(repetition,repet,intervalsec) {
  //console.log(repet);
  //console.log(repetition);
  document.getElementById("controls").innerHTML = repetition-repet+" repetions to go"; 
 
    startProgressBar(intervalsec,'100%',6);
    repet++;

  if(buttoninterval){
    
    clearInterval(buttoninterval);
  }
  strengthinterval = setInterval(function(){ 
   // console.log("isnide intervale");
    document.getElementById("controls").innerHTML = repetition-repet+" repetions to go";  
    if (repet==repetition) {
      //console.log("isnide equal repet");

      document.getElementById("controls").innerHTML = "Completed"; 
      //location.reload();
      return;
    }
   
       // console.log("inside test button");
        $("#strengthcontractions").click();
     
    repet++;
    
   },(intervalsec*300)+6000);


}


//document.getElementById("playBut").addEventListener("click",startProgressBar(50));
