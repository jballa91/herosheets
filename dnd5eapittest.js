const fetch = require("node-fetch");


const getClasses = async () => {
    const data = await fetch("https://www.dnd5eapi.co/api/backgrounds")
    const classes = await data.json()
    console.log(classes)
    // console.log(classes.proficiency_choices[0].from)
    return true;
};

getClasses()