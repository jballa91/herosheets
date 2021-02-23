-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "hashword" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Game" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "dm_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Character" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "level" INTEGER NOT NULL,
    "wallet" TEXT NOT NULL,
    "class_id" INTEGER NOT NULL,
    "personality" TEXT NOT NULL,
    "ideals" TEXT NOT NULL,
    "bonds" TEXT NOT NULL,
    "flaws" TEXT NOT NULL,
    "speed" INTEGER NOT NULL,
    "strength" INTEGER NOT NULL,
    "dexterity" INTEGER NOT NULL,
    "constitution" INTEGER NOT NULL,
    "intelligence" INTEGER NOT NULL,
    "wisdom" INTEGER NOT NULL,
    "charisma" INTEGER NOT NULL,
    "armorClass" INTEGER NOT NULL,
    "background" TEXT NOT NULL,
    "race_id" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AbilityScore" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,
    "description" TEXT[],
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skill" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "ability_score_id" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "classId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Class" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "hit_die" INTEGER NOT NULL,
    "proficiency_choices" INTEGER NOT NULL,
    "starting_equipment_choices" INTEGER NOT NULL,
    "starting_equipment_choices2" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "traitId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Background" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "starting_equipment_choices" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "equipmentCategoryId" INTEGER,
    "featureId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Equipment" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "equipment_category_id" INTEGER NOT NULL,
    "gear_category_id" INTEGER,
    "weapon_category" TEXT,
    "weapon_range" TEXT,
    "category_range" TEXT,
    "armor_category" TEXT,
    "armor_class" TEXT,
    "str_minimum" INTEGER,
    "stealth_disadv" BOOLEAN,
    "cost" TEXT,
    "damage" TEXT,
    "two_handed_damage" TEXT,
    "range" INTEGER,
    "weight" DOUBLE PRECISION,
    "url" TEXT NOT NULL,
    "classId" INTEGER,
    "equipmentId" INTEGER,
    "equipmentCategoryId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Proficiency" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "backgroundId" INTEGER,
    "subRaceId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trait" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT[],
    "proficiencies_choices" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "classId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubRace" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "race_id" INTEGER NOT NULL,
    "description" TEXT NOT NULL,
    "ability_bonuses" TEXT,
    "language_choice_num" INTEGER,
    "traits_choices_num" INTEGER,
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Language" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "script" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "characterId" INTEGER,
    "backgroundId" INTEGER,
    "subRaceId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Alignment" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "abbreviation" TEXT NOT NULL,
    "description" TEXT[],
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Level" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "ability_score_bonuses" INTEGER NOT NULL,
    "prof_bonus" INTEGER NOT NULL,
    "class_id" INTEGER NOT NULL,
    "subClassId" INTEGER,
    "classId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SubClass" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "class_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "flavor" TEXT NOT NULL,
    "description" TEXT[],
    "url" TEXT NOT NULL,
    "classId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feature" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "level" INTEGER,
    "description" TEXT[],
    "url" TEXT NOT NULL,
    "levelId" INTEGER,
    "classId" INTEGER,
    "subClassId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Race" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "speed" INTEGER NOT NULL,
    "ability_bonuses" TEXT NOT NULL,
    "alignment" TEXT,
    "age" TEXT,
    "size" TEXT NOT NULL,
    "size_desc" TEXT NOT NULL,
    "languages_desc" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EquipmentCategory" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MagicItem" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "equipment_category_id" INTEGER,
    "description" TEXT[],
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WeaponProperty" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT[],
    "url" TEXT NOT NULL,
    "equipmentId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Spell" (
    "id" SERIAL NOT NULL,
    "description" TEXT[],
    "higher_level" TEXT,
    "range" TEXT,
    "components" TEXT,
    "material" TEXT,
    "ritual" BOOLEAN,
    "duration" TEXT,
    "concentration" BOOLEAN,
    "casting_time" TEXT,
    "level" INTEGER,
    "attack_type" TEXT,
    "damage" TEXT,
    "school_id" INTEGER NOT NULL,
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Monster" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "size" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "subtype" TEXT NOT NULL,
    "alignment" TEXT NOT NULL,
    "armor_class" INTEGER NOT NULL,
    "hit_points" INTEGER NOT NULL,
    "hit_dice" TEXT NOT NULL,
    "speed" JSONB[],
    "strength" INTEGER NOT NULL,
    "dexterity" INTEGER NOT NULL,
    "constitution" INTEGER NOT NULL,
    "intelligence" INTEGER NOT NULL,
    "wisdom" INTEGER NOT NULL,
    "charisma" INTEGER NOT NULL,
    "damage_vulnerabilities" TEXT[],
    "damage_resistances" TEXT NOT NULL,
    "damage_immunities" TEXT NOT NULL,
    "condition_immunities" TEXT NOT NULL,
    "senses" JSONB NOT NULL,
    "languages" TEXT NOT NULL,
    "challenge_rating" DOUBLE PRECISION NOT NULL,
    "special_abilities" JSONB[],
    "actions" JSONB[],
    "legendary_actions" JSONB[],
    "url" TEXT NOT NULL,
    "monsterId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Condition" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT[],
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DamageType" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT[],
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MagicSchool" (
    "id" SERIAL NOT NULL,
    "inex" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT[],
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rules" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleSection" (
    "id" SERIAL NOT NULL,
    "index" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "rulesId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inventory" (
    "characterId" INTEGER NOT NULL,
    "itemId" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,

    PRIMARY KEY ("characterId","itemId")
);

-- CreateTable
CREATE TABLE "_party" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AbilityScoreToSkill" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_proficiencies" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_proficiency_choices_class" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_starting_equipment" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_starting_equipment_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ClassToSpell" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_starting_equipment_bg" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_starting_equipment_choices_bg" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ProficiencyToRace" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_proficiency" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_proficiency_choices_trait" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_RaceToTrait" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_subrace_traits" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_subrace_traits_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_LanguageToRace" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_feature_choices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_SpellToSubClass" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User.username_unique" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User.email_unique" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "AbilityScore.index_unique" ON "AbilityScore"("index");

-- CreateIndex
CREATE UNIQUE INDEX "AbilityScore.name_unique" ON "AbilityScore"("name");

-- CreateIndex
CREATE UNIQUE INDEX "AbilityScore.full_name_unique" ON "AbilityScore"("full_name");

-- CreateIndex
CREATE UNIQUE INDEX "AbilityScore.url_unique" ON "AbilityScore"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Skill.index_unique" ON "Skill"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Skill.name_unique" ON "Skill"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Skill.url_unique" ON "Skill"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Class.index_unique" ON "Class"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Class.name_unique" ON "Class"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Class.url_unique" ON "Class"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Background.index_unique" ON "Background"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Background.url_unique" ON "Background"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Equipment.index_unique" ON "Equipment"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Equipment.url_unique" ON "Equipment"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Proficiency.index_unique" ON "Proficiency"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Proficiency.name_unique" ON "Proficiency"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Proficiency.url_unique" ON "Proficiency"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Trait.index_unique" ON "Trait"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Trait.name_unique" ON "Trait"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Trait.url_unique" ON "Trait"("url");

-- CreateIndex
CREATE UNIQUE INDEX "SubRace.index_unique" ON "SubRace"("index");

-- CreateIndex
CREATE UNIQUE INDEX "SubRace.url_unique" ON "SubRace"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Language.index_unique" ON "Language"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Language.name_unique" ON "Language"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Language.url_unique" ON "Language"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Alignment.index_unique" ON "Alignment"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Alignment.url_unique" ON "Alignment"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Level.index_unique" ON "Level"("index");

-- CreateIndex
CREATE UNIQUE INDEX "SubClass.index_unique" ON "SubClass"("index");

-- CreateIndex
CREATE UNIQUE INDEX "SubClass.url_unique" ON "SubClass"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Feature.index_unique" ON "Feature"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Feature.url_unique" ON "Feature"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Race.index_unique" ON "Race"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Race.name_unique" ON "Race"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Race.url_unique" ON "Race"("url");

-- CreateIndex
CREATE UNIQUE INDEX "EquipmentCategory.index_unique" ON "EquipmentCategory"("index");

-- CreateIndex
CREATE UNIQUE INDEX "MagicItem.index_unique" ON "MagicItem"("index");

-- CreateIndex
CREATE UNIQUE INDEX "MagicItem.url_unique" ON "MagicItem"("url");

-- CreateIndex
CREATE UNIQUE INDEX "WeaponProperty.index_unique" ON "WeaponProperty"("index");

-- CreateIndex
CREATE UNIQUE INDEX "WeaponProperty.url_unique" ON "WeaponProperty"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Spell.url_unique" ON "Spell"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Monster.index_unique" ON "Monster"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Monster.url_unique" ON "Monster"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Condition.url_unique" ON "Condition"("url");

-- CreateIndex
CREATE UNIQUE INDEX "DamageType.index_unique" ON "DamageType"("index");

-- CreateIndex
CREATE UNIQUE INDEX "DamageType.url_unique" ON "DamageType"("url");

-- CreateIndex
CREATE UNIQUE INDEX "MagicSchool.inex_unique" ON "MagicSchool"("inex");

-- CreateIndex
CREATE UNIQUE INDEX "MagicSchool.url_unique" ON "MagicSchool"("url");

-- CreateIndex
CREATE UNIQUE INDEX "Rules.index_unique" ON "Rules"("index");

-- CreateIndex
CREATE UNIQUE INDEX "Rules.url_unique" ON "Rules"("url");

-- CreateIndex
CREATE UNIQUE INDEX "RuleSection.index_unique" ON "RuleSection"("index");

-- CreateIndex
CREATE UNIQUE INDEX "RuleSection.url_unique" ON "RuleSection"("url");

-- CreateIndex
CREATE UNIQUE INDEX "_party_AB_unique" ON "_party"("A", "B");

-- CreateIndex
CREATE INDEX "_party_B_index" ON "_party"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AbilityScoreToSkill_AB_unique" ON "_AbilityScoreToSkill"("A", "B");

-- CreateIndex
CREATE INDEX "_AbilityScoreToSkill_B_index" ON "_AbilityScoreToSkill"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_proficiencies_AB_unique" ON "_proficiencies"("A", "B");

-- CreateIndex
CREATE INDEX "_proficiencies_B_index" ON "_proficiencies"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_proficiency_choices_class_AB_unique" ON "_proficiency_choices_class"("A", "B");

-- CreateIndex
CREATE INDEX "_proficiency_choices_class_B_index" ON "_proficiency_choices_class"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_starting_equipment_AB_unique" ON "_starting_equipment"("A", "B");

-- CreateIndex
CREATE INDEX "_starting_equipment_B_index" ON "_starting_equipment"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_starting_equipment_choices_AB_unique" ON "_starting_equipment_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_starting_equipment_choices_B_index" ON "_starting_equipment_choices"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClassToSpell_AB_unique" ON "_ClassToSpell"("A", "B");

-- CreateIndex
CREATE INDEX "_ClassToSpell_B_index" ON "_ClassToSpell"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_starting_equipment_bg_AB_unique" ON "_starting_equipment_bg"("A", "B");

-- CreateIndex
CREATE INDEX "_starting_equipment_bg_B_index" ON "_starting_equipment_bg"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_starting_equipment_choices_bg_AB_unique" ON "_starting_equipment_choices_bg"("A", "B");

-- CreateIndex
CREATE INDEX "_starting_equipment_choices_bg_B_index" ON "_starting_equipment_choices_bg"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProficiencyToRace_AB_unique" ON "_ProficiencyToRace"("A", "B");

-- CreateIndex
CREATE INDEX "_ProficiencyToRace_B_index" ON "_ProficiencyToRace"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_proficiency_AB_unique" ON "_proficiency"("A", "B");

-- CreateIndex
CREATE INDEX "_proficiency_B_index" ON "_proficiency"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_proficiency_choices_trait_AB_unique" ON "_proficiency_choices_trait"("A", "B");

-- CreateIndex
CREATE INDEX "_proficiency_choices_trait_B_index" ON "_proficiency_choices_trait"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_RaceToTrait_AB_unique" ON "_RaceToTrait"("A", "B");

-- CreateIndex
CREATE INDEX "_RaceToTrait_B_index" ON "_RaceToTrait"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_traits_AB_unique" ON "_subrace_traits"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_traits_B_index" ON "_subrace_traits"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_subrace_traits_choices_AB_unique" ON "_subrace_traits_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_subrace_traits_choices_B_index" ON "_subrace_traits_choices"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_LanguageToRace_AB_unique" ON "_LanguageToRace"("A", "B");

-- CreateIndex
CREATE INDEX "_LanguageToRace_B_index" ON "_LanguageToRace"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_feature_choices_AB_unique" ON "_feature_choices"("A", "B");

-- CreateIndex
CREATE INDEX "_feature_choices_B_index" ON "_feature_choices"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_SpellToSubClass_AB_unique" ON "_SpellToSubClass"("A", "B");

-- CreateIndex
CREATE INDEX "_SpellToSubClass_B_index" ON "_SpellToSubClass"("B");

-- AddForeignKey
ALTER TABLE "Game" ADD FOREIGN KEY ("dm_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD FOREIGN KEY ("class_id") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD FOREIGN KEY ("race_id") REFERENCES "Race"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Skill" ADD FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Class" ADD FOREIGN KEY ("traitId") REFERENCES "Trait"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Background" ADD FOREIGN KEY ("featureId") REFERENCES "Feature"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Background" ADD FOREIGN KEY ("equipmentCategoryId") REFERENCES "EquipmentCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD FOREIGN KEY ("equipment_category_id") REFERENCES "EquipmentCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD FOREIGN KEY ("gear_category_id") REFERENCES "EquipmentCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD FOREIGN KEY ("equipmentCategoryId") REFERENCES "EquipmentCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Proficiency" ADD FOREIGN KEY ("backgroundId") REFERENCES "Background"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Proficiency" ADD FOREIGN KEY ("subRaceId") REFERENCES "SubRace"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trait" ADD FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubRace" ADD FOREIGN KEY ("race_id") REFERENCES "Race"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Language" ADD FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Language" ADD FOREIGN KEY ("backgroundId") REFERENCES "Background"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Language" ADD FOREIGN KEY ("subRaceId") REFERENCES "SubRace"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Level" ADD FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Level" ADD FOREIGN KEY ("subClassId") REFERENCES "SubClass"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubClass" ADD FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feature" ADD FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feature" ADD FOREIGN KEY ("subClassId") REFERENCES "SubClass"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feature" ADD FOREIGN KEY ("levelId") REFERENCES "Level"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MagicItem" ADD FOREIGN KEY ("equipment_category_id") REFERENCES "EquipmentCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WeaponProperty" ADD FOREIGN KEY ("equipmentId") REFERENCES "Equipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Spell" ADD FOREIGN KEY ("school_id") REFERENCES "MagicSchool"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Monster" ADD FOREIGN KEY ("monsterId") REFERENCES "Monster"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleSection" ADD FOREIGN KEY ("rulesId") REFERENCES "Rules"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD FOREIGN KEY ("characterId") REFERENCES "Character"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD FOREIGN KEY ("itemId") REFERENCES "Equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_party" ADD FOREIGN KEY ("A") REFERENCES "Game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_party" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AbilityScoreToSkill" ADD FOREIGN KEY ("A") REFERENCES "AbilityScore"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AbilityScoreToSkill" ADD FOREIGN KEY ("B") REFERENCES "Skill"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_proficiencies" ADD FOREIGN KEY ("A") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_proficiencies" ADD FOREIGN KEY ("B") REFERENCES "Proficiency"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_proficiency_choices_class" ADD FOREIGN KEY ("A") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_proficiency_choices_class" ADD FOREIGN KEY ("B") REFERENCES "Proficiency"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_starting_equipment" ADD FOREIGN KEY ("A") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_starting_equipment" ADD FOREIGN KEY ("B") REFERENCES "Equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_starting_equipment_choices" ADD FOREIGN KEY ("A") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_starting_equipment_choices" ADD FOREIGN KEY ("B") REFERENCES "Equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassToSpell" ADD FOREIGN KEY ("A") REFERENCES "Class"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClassToSpell" ADD FOREIGN KEY ("B") REFERENCES "Spell"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_starting_equipment_bg" ADD FOREIGN KEY ("A") REFERENCES "Background"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_starting_equipment_bg" ADD FOREIGN KEY ("B") REFERENCES "Equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_starting_equipment_choices_bg" ADD FOREIGN KEY ("A") REFERENCES "Background"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_starting_equipment_choices_bg" ADD FOREIGN KEY ("B") REFERENCES "Equipment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProficiencyToRace" ADD FOREIGN KEY ("A") REFERENCES "Proficiency"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProficiencyToRace" ADD FOREIGN KEY ("B") REFERENCES "Race"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_proficiency" ADD FOREIGN KEY ("A") REFERENCES "Proficiency"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_proficiency" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_proficiency_choices_trait" ADD FOREIGN KEY ("A") REFERENCES "Proficiency"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_proficiency_choices_trait" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RaceToTrait" ADD FOREIGN KEY ("A") REFERENCES "Race"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RaceToTrait" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_traits" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_traits" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_traits_choices" ADD FOREIGN KEY ("A") REFERENCES "SubRace"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_subrace_traits_choices" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LanguageToRace" ADD FOREIGN KEY ("A") REFERENCES "Language"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LanguageToRace" ADD FOREIGN KEY ("B") REFERENCES "Race"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_feature_choices" ADD FOREIGN KEY ("A") REFERENCES "Feature"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_feature_choices" ADD FOREIGN KEY ("B") REFERENCES "Level"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SpellToSubClass" ADD FOREIGN KEY ("A") REFERENCES "Spell"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_SpellToSubClass" ADD FOREIGN KEY ("B") REFERENCES "SubClass"("id") ON DELETE CASCADE ON UPDATE CASCADE;
