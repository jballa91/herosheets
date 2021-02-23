const seedAbilityScores = require("./seedAbilityScores");
const seedAlignments = require("./seedAlignments");
// const seedClasses = require("./seedClasses");
const seedEquipment = require("./seedEquipment");
const seedEquipmentCategories = require("./seedEquipmentCategories");
const seedFeatures = require("./seedFeatures");
const seedLanguages = require("./seedLanguages");
const seedMagicItems = require("./seedMagicItems");
const seedProficiencies = require("./seedProficiencies");
const seedRaces = require("./seedRaces");
const seedSkills = require("./seedSkills");
// const seedSubRaces = require("./seedSubRaces");
const seedTraits = require("./seedTraits");
// const seedTraits = require("./seedTraits");
const seedWeaponProperties = require("./seedWeaponProperties");


const seed = async () => {
    await seedEquipmentCategories();
    await seedWeaponProperties();
    await seedEquipment();
    await seedMagicItems();
    await seedProficiencies();
    await seedTraits();
    await seedLanguages();
    await seedAlignments();
    await seedFeatures();
    await seedAbilityScores();
    await seedSkills();
    await seedRaces();
};

module.exports = seed;