const fetch = require("node-fetch");
const chalk = require("chalk");
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const seedTraits = async () => {
    console.log(chalk.yellow("Starting..."))

    let traitsData = await fetch("https://dnd5eapi.co/api/traits");
    let traits = await traitsData.json();

    console.log(chalk.green("Got Traits."));

    let indices = [];
    for (item of traits.results) {
        indices.push(item.index);
    }

    console.log(chalk.yellow("Seeding Traits..."));
    console.log("");
    for (item of indices) {
        let data = await fetch(`https://dnd5eapi.co/api/traits/${item}`);
        let founditem = await data.json();

        console.log(chalk.black.bgCyan("Trait:"), chalk.cyan(` ${founditem.name}`));

        // For connecting proficiencies to new traits
        let proficiencies = [];
        if (founditem.proficiencies && founditem.proficiencies.length > 0) {
            for (item of founditem.proficiencies) {
                let prof = await prisma.proficiency.findUnique({
                    where: {
                        index: item.index
                    },
                });
                proficiencies.push({id: prof.id});
            }
        }

        // For connecting proficiencies_choices to new traits
        let proficiencies_choices = [];
        let prof_choices_num = 0
        if (founditem.proficiency_choices && founditem.proficiency_choices.length  > 0) {
            prof_choices_num = founditem.proficiency_choices.choose;
            for (item of founditem.proficiency_choices.from) {
                let profchoice = await prisma.proficiency.findUnique({
                    where: {
                        index: item.index,
                    }
                });
                proficiencies_choices.push({id: profchoice.id});
            }
        }

        await prisma.trait.create({
            data: {
                index: founditem.index,
                name: founditem.name,
                description: founditem.desc,
                proficiencies: {
                    connect: [...proficiencies],
                },
                proficiencies_choices: prof_choices_num,
                proficiency_choices: {
                    connect: [...proficiencies_choices],
                },
                url: founditem.index,
            },
        });
    }

    await prisma.$disconnect();
    console.log("");
    console.log("");
    console.log(chalk.green("-----------------------"));
    console.log(chalk.green("FINISHED SEEDING TRAITS"));
    console.log(chalk.green("-----------------------"));
}

seedTraits();