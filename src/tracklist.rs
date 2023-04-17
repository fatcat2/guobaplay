
pub mod tracklist {
    use serenity::client::Context;
    use serenity::model::channel::Message;
    pub async fn get_queue(ctx: &Context, msg: &Message) -> Result<String, String> {

        let guild = msg.guild(&ctx.cache).unwrap();
        let guild_id = guild.id;

        let manager = songbird::get(ctx)
            .await
            .expect("Songbird Voice client placed in at initialisation.")
            .clone();

        if let Some(handler_lock) = manager.get(guild_id) {
            let handler = handler_lock.lock().await;
            let track_queue = handler.queue().current_queue();

            let mut messages: Vec<String> = vec![];

            for i in 1 .. track_queue.len() {
                let track = &track_queue[i];

                let title: &str = match &track.metadata().title {
                    Some(title) => title.as_str(),
                    _ => "title not found"
                };

                let tmp = format!("{}. {}", i, title);

                println!("{:?}", &tmp);

                messages.push(tmp.clone());
            }
            
            let ret_message = format!("```QUEUE:\n{}```", messages.join("\n"));

            return Ok(ret_message);
        }

        return Ok(String::from("not found"));
        

    }

}
