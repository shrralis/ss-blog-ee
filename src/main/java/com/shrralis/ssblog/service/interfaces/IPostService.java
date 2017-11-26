package com.shrralis.ssblog.service.interfaces;

import com.shrralis.ssblog.entity.Post;
import com.shrralis.tools.model.JsonResponse;

public interface IPostService {
    JsonResponse addUpdater(Integer postId, Integer newUpdaterId);

    JsonResponse create(Post post);

    JsonResponse delete(Integer postId, Integer userId);

    JsonResponse edit(Post post, Integer userId);

    JsonResponse get(Integer postId);

    JsonResponse getAll();

    JsonResponse revokeUpdater(Integer postId, Integer updaterId);

    JsonResponse setPosted(Integer postId, boolean isPosted);
}
