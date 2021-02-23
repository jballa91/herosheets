const fetch = require("node-fetch");
const chalk = require("chalk");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedLanguages = async () => {
    console.log(chalk.yellow("Starting..."));

    let langData = await fetch("https://dnd5eapi.co/api/languages");
    let langs = await langData.json();

    console.log(chalk.green("Got Languages."));

    let indices = [];
    for (item of langs.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/languages/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Language:"), chalk.cyan(` ${founditem.name}`))

        await prisma.language.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                type: founditem.type,
                script: founditem.script || "",
                url: founditem.url,
            }
        })

    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("--------------------------"));
    console.log(chalk.green("FINISHED SEEDING LANGUAGES"));
    console.log(chalk.green("--------------------------"));
}

module.exports = seedLanguages;