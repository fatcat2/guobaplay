
pub mod commands {
    /// Returns the help string.
    pub fn help_command() -> String {
        return String::from("Commands include the following:\n```") + 
            String::from("~queue <url|text> : Queue the video at the link or the first search result.\n").as_str() + 
            String::from("~play : Resume play.\n").as_str() +
            String::from("~stop : Stop play.\n").as_str() + 
            String::from("~list : List the tracks that are next up.\n").as_str() + 
            String::from("~leave : Tell the bot to leave.\n").as_str() + 
            String::from("```\n").as_str() + 
            String::from("Check out the code on Github at fatcat2/guobaplay.").as_str();
    }
}
