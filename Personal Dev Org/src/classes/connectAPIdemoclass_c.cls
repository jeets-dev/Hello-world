public class connectAPIdemoclass_c {

    public string feeditemid {get; set;}
    
    public pageReference updateFeed(){
        String communityId = Network.getNetworkId();
        // Get the last feed item created by the current user.
        List<FeedItem> feedItems = [SELECT Id FROM FeedItem WHERE CreatedById = :UserInfo.getUserId() ORDER BY CreatedDate DESC];
        
        if (feedItems.isEmpty()) 
        // Return null within anonymous apex.
        return null;
        String feedElementId = feedItems[0].id;
        ConnectApi.FeedEntityIsEditable isEditable = ConnectApi.ChatterFeeds.isFeedElementEditableByMe(communityId, feedElementId);
        
        if (isEditable.isEditableByMe == true){
            ConnectApi.FeedItemInput feedItemInput = new ConnectApi.FeedItemInput();
            ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();
            ConnectApi.TextSegmentInput textSegmentInput = new ConnectApi.TextSegmentInput();
                messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();
                textSegmentInput.text = 'This is my edited post.';
                messageBodyInput.messageSegments.add(textSegmentInput);
                feedItemInput.body = messageBodyInput;
                ConnectApi.FeedElement editedFeedElement = ConnectApi.ChatterFeeds.updateFeedElement(communityId, feedElementId, feedItemInput);
                
                }
     return null;
    }
}